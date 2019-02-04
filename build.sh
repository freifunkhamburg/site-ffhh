#!/usr/bin/env bash
set -e

function announce () {
	echo '############################' $* >&2
}
function usage () {
	echo "Usage: $0 -g GLUON_PATH" >&2
	echo "       -g GLUON_PATH   Path to a checkout of the gluon repository." >&2
	echo "       -t TARGETS      Comma separated list of gluon targets to build" >&2
	echo "       -o OUT_PATH     Path to the firmware output directory. Default: ${gluon_out}" >&2
	echo "       -s SIGNATURE    Sign firmware with signature" >&2
	echo "       -b              BROKEN=1" >&2
	echo "       -v              verbose" >&2
	echo "       -j JOBS         Run build with -jJOBS. Default: ${proc}" >&2
}

proc=$(nproc)
gluon_out="${HOME}/firmware"

while [ $# -gt 0 ]; do
	case "$1" in
		-g)
			gluon_path="$2"
			shift
			;;
		-t)
			build_targets="$2"
			shift
			;;
		-o)
			gluon_out="$2"
			shift
			;;
		-s)
			signature="$2"
			shift
			;;
		-b)
			export BROKEN=1
			;;
		-j)
			proc="$2"
			shift
			;;
		-v)
			verbose=V=s
			;;
		*)
			echo ERROR: Failed to parse: "${1}" >&2
			usage
			exit 1
			;;
	esac
	shift
done

if [ -z "$gluon_path" ]; then
	usage
	exit 1
fi

gluon_path=$(realpath $gluon_path)
gluon_out=$(realpath $gluon_out)
site_path=$(realpath $(dirname $BASH_SOURCE))

announce GLUON: $gluon_path >&2
announce FFHH SITE PATH: $site_path >&2

pushd $site_path
. ./build.conf
[ "${GLUON_BRANCH}" = "experimental" ] && GLUON_RELEASE="${GLUON_RELEASE}~exp$(date +%Y%m%d)"
export GLUON_RELEASE
export GLUON_BRANCH
# if a list of build targets has been supplied, only build those
targets="$(echo "${build_targets:-$targets}" | sed -e 's_,_ _g')"
announce The following targets will be generated: $targets >&2
popd

pushd "${gluon_path}"
announce Starting make update...
export GLUON_SITEDIR="${site_path}"
export GLUON_OUTPUTDIR="${gluon_out}/${GLUON_RELEASE}/${GLUON_BRANCH}"
rm -rf "${GLUON_OUTPUTDIR}"
mkdir -p "${GLUON_OUTPUTDIR}"
make update
# Try to install patches. I wasn't able to figure out how patches in gluon/site/patches work.
for p in ${site_path}/patches/*.patch; do
	if [ -e "$p" -a ! -f "${gluon_path}/${p##*/}" ]; then
		announce Installing patch $p
		patch -p1 < $p
		touch "${gluon_path}/${p##*/}"
	fi
done
for t in $targets; do
	announce Starting build for $t... >&2
	make -j$(nproc) GLUON_TARGET=$t $verbose
done
announce Building manifest...
make manifest
if [ -n "${signature}" ]; then
	if [ "$GLUON_BRANCH" == "experimental" ]; then
		announce Signing...
		"${gluon_path}/contrib/sign.sh" "${signature}" "${GLUON_OUTPUTDIR}/images/sysupgrade/experimental.manifest"
	else
		echo ERROR: can only sign experimental branch >&2
		exit 1
	fi
fi
popd

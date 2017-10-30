#!/bin/bash -e

function announce () {
	echo '############################' $* >&2
}

proc=$(nproc)
gluon_out="${HOME}/firmware"

while getopts g:j:o:s:bv opt; do
	case "$opt" in
		g) gluon_path="$OPTARG" ;;
		o) gluon_out="$OPTARG" ;;
		s) signature="$OPTARG" ;;
		b) export BROKEN=1 ;;
		j) proc="$OPTARG" ;;
		v) verbose=V=s ;;
	esac
done
if [ -z "${gluon_path}" ]; then
	echo "Usage: $0 -g GLUON_PATH" >&2
	echo "       -g GLUON_PATH   Path to a checkout of the gluon repository." >&2
	echo "       -o OUT_PATH     Path to a checkout of the gluon repository. Default: ${gluon_out}" >&2
	echo "       -s SIGNATURE    Sign firmware with signature" >&2
	echo "       -b              BROKEN=1" >&2
	echo "       -v              verbose" >&2
	echo "       -j JOBS         Run build with -jJOBS. Default: ${proc}" >&2
	exit 1
fi

gluon_path=$(realpath $gluon_path)
gluon_out=$(realpath $gluon_out)
site_path=$(realpath $(dirname $BASH_SOURCE))

announce GLUON: $gluon_path >&2
announce FFHH SITES: $site_path >&2

# Build the site repo and generate all site configs
announce Building site repo and reading data >&2
pushd $site_path > /dev/null
make
. info
export GLUON_RELEASE
export GLUON_BRANCH
# get the available sites...
if [ "$sites" == "" ]; then
	for s in sites/*; do sites="${sites} ${s##*/}"; done
fi
announce Gluon will be built for the following sites:$sites >&2
announce The following targets will be generated: $targets >&2
popd >/dev/null

pushd "${gluon_path}" >/dev/null
announce Starting make update...
for s in $sites; do
	export GLUON_SITEDIR="${site_path}/sites/${s}"
	export GLUON_OUTPUTDIR="${gluon_out}/${GLUON_RELEASE}/${GLUON_BRANCH}/${s}"
	export GLUON_IMAGEDIR="${GLUON_OUTPUTDIR}/images"
	export GLUON_MODULEDIR="${GLUON_OUTPUTDIR}/modules"
	rm -rf "${GLUON_OUTPUTDIR}"
	mkdir -p "${GLUON_IMAGEDIR}" "${GLUON_MODULEDIR}"
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
		announce make clean for $s/$t... >&2
		make -j1 clean GLUON_TARGET=$t
		announce Starting build for $s/$t... >&2
		make -j$(nproc) GLUON_TARGET=$t $verbose
	done
	announce Building manifest...
	make manifest
	if [ -n "${signature}" ]; then
		if [ "$GLUON_BRANCH" == "experimental" ]; then
			announce Signing
			"${gluon_path}/contrib/sign.sh" "${signature}" "${GLUON_IMAGEDIR}/sysupgrade/experimental.manifest"
		else
			echo ERROR: can only sign experimental branch >&2
			exit 1
		fi
	fi
done
popd >/dev/null

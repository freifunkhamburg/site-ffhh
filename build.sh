#!/bin/bash -e

function announce () {
	echo '############################' $* >&2
}

proc=$(nproc)

while getopts g:bj:v opt; do
	case "$opt" in
		g) gluon_path="$OPTARG" ;;
		b) export BROKEN=1 ;;
		j) proc="$OPTARG" ;;
		v) verbose=V=s ;;
	esac
done
if [ -z "${gluon_path}" ]; then
	echo "Usage: $0 -g GLUON_PATH" >&2
	echo "       GLUON_PATH      Path to a checkout of the gluon repository." >&2
	echo "       -b              BROKEN=1" >&2
	echo "       -j JOBS         Run build with -jJOBS. Default: ${proc}" >&2
	exit 1
fi

gluon_path=$(realpath $gluon_path)
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
sites=""
for s in sites/*; do sites="${sites} ${s##*/}"; done
announce Gluon will be built for the following sites:$sites >&2
announce The following targets will be generated: $targets >&2
popd >/dev/null

pushd "${gluon_path}" >/dev/null
announce Starting make update...
for s in $sites; do
	export GLUON_SITEDIR="${site_path}/sites/${s}"
	export GLUON_OUTPUTDIR="${HOME}/firmware/${s}/${GLUON_BRANCH}/${GLUON_RELEASE}"
	export GLUON_IMAGEDIR="${GLUON_OUTPUTDIR}/images"
	export GLUON_MODULEDIR="${GLUON_OUTPUTDIR}/modules"
	rm -rf "${GLUON_OUTPUTDIR}"
	mkdir -p "${GLUON_IMAGEDIR}" "${GLUON_MODULEDIR}"
	make update
	for t in $targets; do
		announce Starting build for $s/$t... >&2
		make -j$(nproc) GLUON_TARGET=$t $verbose
	done
	announce Building manifest...
	make manifest
done
popd >/dev/null

export PATH="$PATH:$PWD"
chmod u+x ./*.sh
chmod -x ./setup.sh

for rc in $PWD/.bashrc.d/*; do
	if [ -f "$rc" ]; then
		. "$rc"
	fi
done

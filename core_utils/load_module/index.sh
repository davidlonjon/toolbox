
function load_module() {
	if [ -f "$lib/$1/index.sh" ]; then
	  source "$lib/$1/index.sh"
	  e_success "$1 module loaded"
	else
	  e_error "$1 module failed to load. Exiting"
	  exit
	fi

}


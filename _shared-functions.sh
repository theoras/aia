contains_element() { #{{{
    #check if an element exist in a string
    for e in "${@:2}"; do [[ $e == $1 ]] && break; done;
  } #}}}

invalid_option() { #{{{
    echo "Invalid option. Try another one."
} #}}}
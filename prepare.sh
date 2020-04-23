load_lib secrets
load_lib kv
load_lib docker

create_input_kv ldap_domain
create_input_kv ldap_base_dn
create_input_kv ldap_organisation
create_generate_secret ldap_pass

export LDAP_PASSWORD="`get_secret ldap_pass`"
export LDAP_DOMAIN="`get_kv ldap_domain`"
export LDAP_BASE_DN="`get_kv ldap_base_dn`"
export LDAP_ORGANISATION="`get_kv ldap_organisation`"
export LDAP_NETWORK=$(get_network_name ldap)

set_kv ldap_stack $STACK_NAME

require_network "ldap"

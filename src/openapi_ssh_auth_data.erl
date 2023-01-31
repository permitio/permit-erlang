-module(openapi_ssh_auth_data).

-export([encode/1]).

-export_type([openapi_ssh_auth_data/0]).

-type openapi_ssh_auth_data() ::
    #{ 'auth_type' => binary(),
       'username' := binary(),
       'public_key' => binary(),
       'private_key' := binary()
     }.

encode(#{ 'auth_type' := AuthType,
          'username' := Username,
          'public_key' := PublicKey,
          'private_key' := PrivateKey
        }) ->
    #{ 'auth_type' => AuthType,
       'username' => Username,
       'public_key' => PublicKey,
       'private_key' => PrivateKey
     }.

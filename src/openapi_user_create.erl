-module(openapi_user_create).

-export([encode/1]).

-export_type([openapi_user_create/0]).

-type openapi_user_create() ::
    #{ 'key' := binary(),
       'email' => binary(),
       'first_name' => binary(),
       'last_name' => binary(),
       'attributes' => maps:map()
     }.

encode(#{ 'key' := Key,
          'email' := Email,
          'first_name' := FirstName,
          'last_name' := LastName,
          'attributes' := Attributes
        }) ->
    #{ 'key' => Key,
       'email' => Email,
       'first_name' => FirstName,
       'last_name' => LastName,
       'attributes' => Attributes
     }.

-module(openapi_user_update).

-export([encode/1]).

-export_type([openapi_user_update/0]).

-type openapi_user_update() ::
    #{ 'email' => binary(),
       'first_name' => binary(),
       'last_name' => binary(),
       'attributes' => maps:map()
     }.

encode(#{ 'email' := Email,
          'first_name' := FirstName,
          'last_name' := LastName,
          'attributes' := Attributes
        }) ->
    #{ 'email' => Email,
       'first_name' => FirstName,
       'last_name' => LastName,
       'attributes' => Attributes
     }.

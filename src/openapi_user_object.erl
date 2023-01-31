-module(openapi_user_object).

-export([encode/1]).

-export_type([openapi_user_object/0]).

-type openapi_user_object() ::
    #{ 'id' := openapi_u_uid:openapi_u_uid(),
       'key' := binary(),
       'email' => binary(),
       'first_name' => binary(),
       'last_name' => binary(),
       'attributes' => maps:map(),
       'assigned_roles' => list(),
       'created_at' := openapi_date_time:openapi_date_time(),
       'updated_at' := openapi_date_time:openapi_date_time()
     }.

encode(#{ 'id' := Id,
          'key' := Key,
          'email' := Email,
          'first_name' := FirstName,
          'last_name' := LastName,
          'attributes' := Attributes,
          'assigned_roles' := AssignedRoles,
          'created_at' := CreatedAt,
          'updated_at' := UpdatedAt
        }) ->
    #{ 'id' => Id,
       'key' => Key,
       'email' => Email,
       'first_name' => FirstName,
       'last_name' => LastName,
       'attributes' => Attributes,
       'assigned_roles' => AssignedRoles,
       'created_at' => CreatedAt,
       'updated_at' => UpdatedAt
     }.

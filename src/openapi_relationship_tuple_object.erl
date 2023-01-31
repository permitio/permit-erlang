-module(openapi_relationship_tuple_object).

-export([encode/1]).

-export_type([openapi_relationship_tuple_object/0]).

-type openapi_relationship_tuple_object() ::
    #{ 'subject_str' := binary(),
       'relation_str' := binary(),
       'object_str' := binary()
     }.

encode(#{ 'subject_str' := SubjectStr,
          'relation_str' := RelationStr,
          'object_str' := ObjectStr
        }) ->
    #{ 'subject_str' => SubjectStr,
       'relation_str' => RelationStr,
       'object_str' => ObjectStr
     }.

-module(openapi_language_instructions).

-export([encode/1]).

-export_type([openapi_language_instructions/0]).

-type openapi_language_instructions() ::
    #{ 'language' := openapi_programming_language:openapi_programming_language(),
       'label' := binary(),
       'instructions' := binary()
     }.

encode(#{ 'language' := Language,
          'label' := Label,
          'instructions' := Instructions
        }) ->
    #{ 'language' => Language,
       'label' => Label,
       'instructions' => Instructions
     }.

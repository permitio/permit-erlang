-module(openapi_data_source_entry).

-export([encode/1]).

-export_type([openapi_data_source_entry/0]).

-type openapi_data_source_entry() ::
    #{ 'url' := binary(),
       'config' => maps:map(),
       'topics' => list(),
       'dst_path' => binary(),
       'save_method' => binary()
     }.

encode(#{ 'url' := Url,
          'config' := Config,
          'topics' := Topics,
          'dst_path' := DstPath,
          'save_method' := SaveMethod
        }) ->
    #{ 'url' => Url,
       'config' => Config,
       'topics' => Topics,
       'dst_path' => DstPath,
       'save_method' => SaveMethod
     }.

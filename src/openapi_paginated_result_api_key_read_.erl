-module(openapi_paginated_result_api_key_read_).

-export([encode/1]).

-export_type([openapi_paginated_result_api_key_read_/0]).

-type openapi_paginated_result_api_key_read_() ::
    #{ 'data' := list(),
       'total_count' := integer(),
       'page_count' => integer()
     }.

encode(#{ 'data' := Data,
          'total_count' := TotalCount,
          'page_count' := PageCount
        }) ->
    #{ 'data' => Data,
       'total_count' => TotalCount,
       'page_count' => PageCount
     }.

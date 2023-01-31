-module(openapi_opal_client).

-export([encode/1]).

-export_type([openapi_opal_client/0]).

-type openapi_opal_client() ::
    #{ 'DATA_TOPICS' := list(),
       'CLIENT_TOKEN' := binary(),
       'SERVER_URL' := binary(),
       'SERVER_WS_URL' := binary(),
       'SERVER_PUBSUB_URL' := binary(),
       'DEFAULT_DATA_SOURCES_CONFIG_URL' := binary(),
       'SCOPE_ID' => binary()
     }.

encode(#{ 'DATA_TOPICS' := DATATOPICS,
          'CLIENT_TOKEN' := CLIENTTOKEN,
          'SERVER_URL' := SERVERURL,
          'SERVER_WS_URL' := SERVERWSURL,
          'SERVER_PUBSUB_URL' := SERVERPUBSUBURL,
          'DEFAULT_DATA_SOURCES_CONFIG_URL' := DEFAULTDATASOURCESCONFIGURL,
          'SCOPE_ID' := SCOPEID
        }) ->
    #{ 'DATA_TOPICS' => DATATOPICS,
       'CLIENT_TOKEN' => CLIENTTOKEN,
       'SERVER_URL' => SERVERURL,
       'SERVER_WS_URL' => SERVERWSURL,
       'SERVER_PUBSUB_URL' => SERVERPUBSUBURL,
       'DEFAULT_DATA_SOURCES_CONFIG_URL' => DEFAULTDATASOURCESCONFIGURL,
       'SCOPE_ID' => SCOPEID
     }.

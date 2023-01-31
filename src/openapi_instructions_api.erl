-module(openapi_instructions_api).

-export([list_language_instructions/3, list_language_instructions/4]).

-define(BASE_URL, <<"">>).

%% @doc List Language Instructions
%% Lists pending organization invites
-spec list_language_instructions(ctx:ctx(), binary(), binary()) -> {ok, [openapi_language_instructions:openapi_language_instructions()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_language_instructions(Ctx, ProjId, EnvId) ->
    list_language_instructions(Ctx, ProjId, EnvId, #{}).

-spec list_language_instructions(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, [openapi_language_instructions:openapi_language_instructions()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_language_instructions(Ctx, ProjId, EnvId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/", ProjId, "/", EnvId, "/get_instructions">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).



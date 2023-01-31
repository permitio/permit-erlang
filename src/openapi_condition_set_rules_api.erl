-module(openapi_condition_set_rules_api).

-export([assign_set_permissions/4, assign_set_permissions/5,
         list_set_permissions/3, list_set_permissions/4,
         unassign_set_permissions/4, unassign_set_permissions/5]).

-define(BASE_URL, <<"">>).

%% @doc Assign Set Permissions
%% Grant permissions to a user set *on* a resource set.  If the permission is already granted, it is skipped.
-spec assign_set_permissions(ctx:ctx(), binary(), binary(), openapi_condition_set_rule_create:openapi_condition_set_rule_create()) -> {ok, [openapi_condition_set_rule_read:openapi_condition_set_rule_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
assign_set_permissions(Ctx, ProjId, EnvId, OpenapiConditionSetRuleCreate) ->
    assign_set_permissions(Ctx, ProjId, EnvId, OpenapiConditionSetRuleCreate, #{}).

-spec assign_set_permissions(ctx:ctx(), binary(), binary(), openapi_condition_set_rule_create:openapi_condition_set_rule_create(), maps:map()) -> {ok, [openapi_condition_set_rule_read:openapi_condition_set_rule_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
assign_set_permissions(Ctx, ProjId, EnvId, OpenapiConditionSetRuleCreate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = [<<"/v2/facts/", ProjId, "/", EnvId, "/set_rules">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiConditionSetRuleCreate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc List Set Permissions
%% Lists the condition set rules matching the filter. - If the `user_set` filter is present, will only return the permissions set of that user set. - If the `permission` filter is present, will only return the permissions sets that equals to the queried permission. - If the `resource_set` filter is present, will only return the permissions set of that resource set.
-spec list_set_permissions(ctx:ctx(), binary(), binary()) -> {ok, [openapi_condition_set_rule_read:openapi_condition_set_rule_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_set_permissions(Ctx, ProjId, EnvId) ->
    list_set_permissions(Ctx, ProjId, EnvId, #{}).

-spec list_set_permissions(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, [openapi_condition_set_rule_read:openapi_condition_set_rule_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_set_permissions(Ctx, ProjId, EnvId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/facts/", ProjId, "/", EnvId, "/set_rules">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['user_set', 'permission', 'resource_set', 'page', 'per_page'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Unassign Set Permissions
%% Revokes permissions to a user set *on* a resource set.  If the permission is not granted, it is skipped.
-spec unassign_set_permissions(ctx:ctx(), binary(), binary(), openapi_condition_set_rule_remove:openapi_condition_set_rule_remove()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
unassign_set_permissions(Ctx, ProjId, EnvId, OpenapiConditionSetRuleRemove) ->
    unassign_set_permissions(Ctx, ProjId, EnvId, OpenapiConditionSetRuleRemove, #{}).

-spec unassign_set_permissions(ctx:ctx(), binary(), binary(), openapi_condition_set_rule_remove:openapi_condition_set_rule_remove(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
unassign_set_permissions(Ctx, ProjId, EnvId, OpenapiConditionSetRuleRemove, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = [<<"/v2/facts/", ProjId, "/", EnvId, "/set_rules">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiConditionSetRuleRemove,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).



-module(openapi_pdp).

-export([encode/1]).

-export_type([openapi_pdp/0]).

-type openapi_pdp() ::
    #{ 'BACKEND_SERVICE_URL' := binary(),
       'OPA_DECISION_LOG_INGRESS_ROUTE' := binary(),
       'OPA_DECISION_LOG_INGRESS_BACKEND_TIER_URL' := binary()
     }.

encode(#{ 'BACKEND_SERVICE_URL' := BACKENDSERVICEURL,
          'OPA_DECISION_LOG_INGRESS_ROUTE' := OPADECISIONLOGINGRESSROUTE,
          'OPA_DECISION_LOG_INGRESS_BACKEND_TIER_URL' := OPADECISIONLOGINGRESSBACKENDTIERURL
        }) ->
    #{ 'BACKEND_SERVICE_URL' => BACKENDSERVICEURL,
       'OPA_DECISION_LOG_INGRESS_ROUTE' => OPADECISIONLOGINGRESSROUTE,
       'OPA_DECISION_LOG_INGRESS_BACKEND_TIER_URL' => OPADECISIONLOGINGRESSBACKENDTIERURL
     }.

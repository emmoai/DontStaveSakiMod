name = "Health Regeneration"
description = [[Players will regenerate their health when their hunger and sanity levels are above certain levels, as a trade-off they will loose hunger.]]
author = "Holpites"
version = "1.1.2"

forumthread = ""

api_version = 10

icon_atlas = "modicon.xml"
icon = "modicon.tex"

dont_starve_compatible = false
dst_compatible = true
client_only_mod = false
all_clients_require_mod = true

server_filter_tags = 
{
    "health regen",
    "regeneration",
    "health"
}

configuration_options =
{
    { 
        name = "REQUIRED_HUNGER_PRECENT",
        label = "Required Hunger for Regeneration",
        options =
        {
            {
                description = "None",
                data = 0
            },
			{
                description = ">25%",
                data = 0.25
            },
            {
                description = ">50%",
                data = 0.50
            },
			{
                description = ">66%",
                data = 0.66
            },			
			{
                description = ">75%",
                data = 0.75
            },
			{
                description = ">85%",
                data = 0.85
            },
        },
        default = 0.66,
    },
    { 
        name = "REQUIRED_SANITY_PERCENT",
        label = "Required Sanity for Regeneration",
        options =
        {
            {
                description = "None",
                data = 0
            },
			{
                description = ">25%",
                data = 0.25
            },
            {
                description = ">50%",
                data = 0.50
            },
			{
                description = ">66%",
                data = 0.66
            },
			{
                description = ">75%",
                data = 0.75
            },
			{
                description = ">85%",
                data = 0.85
            },
        },
        default = 0.25,
    },	
    {
        name = "REGENERATION_RATE",
        label = "Regeneration Rate",
        options =
        {
            {
                description = "Slow",
                data = 105
            },
            {
                description = "Slower",
                data =60
            },
            {
                description = "Normal", --~15.5 HP/Day
                data = 32
            },
            {
                description = "Faster",
                data = 15
            },
            {
                description = "Fast",
                data = 8
            },
        },
        default = 32,
    },
    {
        name = "HUNGER_DRAIN_RATE",
        label = "Hunger Drain Rate",
        options =
        {
            {
                description = "None",
                data = 0
            },
            {
                description = "Slow",
                data = 0.8
            },
            {
                description = "Slower",
                data = 1
            },
            {
                description = "Normal",
                data = 1.2
            },
            {
                description = "Faster",
                data = 1.6
            },
            {
                description = "Fast",
                data = 2
            },
        },
        default = 1.2,
    },
    {
        name = "WIDGET_ENABLED",
        label = "Widget Enabled",
        options =
        {
            {
                description = "Yes",
                data = 1
            },
            {
                description = "No",
                data = 0
            },
        },
        default = 1,
    },		
}
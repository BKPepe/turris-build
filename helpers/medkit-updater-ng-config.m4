dnl This is updater-ng uci configuration to be used in generated medkit
divert(-1)
changequote(`[', `]')
define([foreach],[ifelse(eval($#>2),1,[pushdef([$1],[$3])$2[]popdef([$1])[]ifelse(eval($#>3),1,[$0([$1],[$2],shift(shift(shift($@))))])])])
divert(0)dnl

dnl In default automatic updater execution is disabled
config autorun 'autorun'
	option enabled '0'

dnl Set branch from BRANCH variable
dnl Also enable all lists that were added during medkit generation.
config turris 'turris'
	option mode 'branch'
ifdef([_UPDATER_BRANCH_],	option branch '_UPDATER_BRANCH_'
)dnl
ifdef([_LISTS_],foreach([LIST], [	list pkglists 'LIST'
], _LISTS_)
)dnl

dnl Enable all languages that were enabled durring medkit generation.
ifdef([_LANGS_], config l10n 'l10n'
foreach([LANG], [	list langs 'LANG'
], _LANGS_)
)dnl

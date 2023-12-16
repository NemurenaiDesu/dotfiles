workspace_id="$1"
command="$2"
silent="$3"

if [[ -z $silent || $silent != "--silent" ]]; then
    hyprctl dispatch workspace "$workspace_id"
fi

WorkspaceLastWindow=$(hyprctl -j workspaces | jq --arg id "$workspace_id" '.[] | select(.id == ($id|tonumber)) | .lastwindowtitle')
WorkspaceLastWindow="${WorkspaceLastWindow//\"}"

if [[ -z $WorkspaceLastWindow ]]; then
    hyprctl dispatch exec [workspace "$workspace_id" silent] "$command"
fi

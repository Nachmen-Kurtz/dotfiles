import os, subprocess
import libqtile.resources

from libqtile        import bar, layout, qtile, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy   import lazy
from libqtile.utils  import guess_terminal

@hook.subscribe.startup_once
def autostart():
    subprocess.Popen(os.path.expanduser("~/.config/qtile/autostart.sh"))

mod      = "mod4"
terminal = "alacritty"

keys = [
    Key([mod],            "h",      lazy.layout.left(),              desc="Move focus to left"),
    Key([mod],            "l",      lazy.layout.right(),             desc="Move focus to right"),
    Key([mod],            "j",      lazy.layout.down(),              desc="Move focus down"),
    Key([mod],            "k",      lazy.layout.up(),                desc="Move focus up"),
    Key([mod],            "space",  lazy.layout.next(),              desc="Move window focus to other window"),

    Key([mod, "shift"],   "h",      lazy.layout.shuffle_left(),      desc="Move window to the left"),
    Key([mod, "shift"],   "l",      lazy.layout.shuffle_right(),     desc="Move window to the right"),
    Key([mod, "shift"],   "j",      lazy.layout.shuffle_down(),      desc="Move window down"),
    Key([mod, "shift"],   "k",      lazy.layout.shuffle_up(),        desc="Move window up"),

    Key([mod, "control"], "h",      lazy.layout.grow_left(),         desc="Grow window to the left"),
    Key([mod, "control"], "l",      lazy.layout.grow_right(),        desc="Grow window to the right"),
    Key([mod, "control"], "j",      lazy.layout.grow_down(),         desc="Grow window down"),
    Key([mod, "control"], "k",      lazy.layout.grow_up(),           desc="Grow window up"),

    Key([mod],            "n",      lazy.layout.normalize(),         desc="Reset all window sizes"),
    Key([mod, "shift"],   "Return", lazy.layout.toggle_split(),      desc="Toggle between split and unsplit sides of stack"),
    Key([mod],            "Return", lazy.spawn(terminal),            desc="Launch terminal"),
    Key([mod],            "Tab",    lazy.next_layout(),              desc="Toggle between layouts"),
    Key([mod],            "w",      lazy.window.kill(),              desc="Kill focused window"),
    Key([mod],            "f",      lazy.window.toggle_fullscreen(), desc="Toggle fullscreen on the focused window"),
    Key([mod],            "t",      lazy.window.toggle_floating(),   desc="Toggle floating on the focused window"),
    Key([mod, "control"], "r",      lazy.reload_config(),            desc="Reload the config"),
    Key([mod, "control"], "q",      lazy.shutdown(),                 desc="Shutdown Qtile"),
    Key([mod],            "r",      lazy.spawncmd(),                 desc="Spawn a command using a prompt widget"),

    Key([mod], "p", lazy.spawn("powermenu-void.sh"), desc="kill, suspend, poweroff and reboot"),

    Key([mod, "control"], "a", lazy.spawn("rofi -show drun"),        desc="Launch rofi"),
    Key([mod, "control"], "c", lazy.spawn("rofi -show run"),         desc="Launch rofi run prompt"),
    Key([mod, "control"], "f", lazy.spawn("rofi -show filebrowser"), desc="Launch rofi file browser"),
    Key([mod, "control"], "w", lazy.spawn("rofi -show window"),      desc="Launch rofi window switcher"),
    Key([mod, "control"], "s", lazy.spawn("rofi -show ssh"),         desc="Launch rofi SSH launcher"),

    Key([], "XF86AudioMute",        lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle"),     desc="Toggle mute"),
    Key([], "XF86AudioMicMute",     lazy.spawn("pactl set-source-mute @DEFAULT_SOURCE@ toggle"), desc="Toggle mic mute"),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%"),      desc="Volume up"),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%"),      desc="Volume down"),

    Key([], "XF86MonBrightnessUp",   lazy.spawn("brightnessctl set 5%+"), desc="Brightness up"),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 5%-"), desc="Brightness down"),

    Key([mod], "F1", lazy.spawn("notifi-info.sh time"),    desc="Show time"),
    Key([mod], "F2", lazy.spawn("notify-info.sh date"),    desc="Show date"),
    Key([mod], "F3", lazy.spawn("notify-info.sh battery"), desc="Show battery"),
]

groups = []
group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
group_labels = [" ", "󰖟 ", " ", "󱀞 ", " ", " ", " ", " ", " ", " "]

group_matches = {
    "2": [Match(wm_class="vivaldi-stable"),
          Match(wm_class="firefox"),
          Match(wm_class="org.mozilla.firefox")],
    "4": [Match(wm_class="gpodder"),
          Match(wm_class="io.github.alainm23.planify")],
    "5": [Match(wm_class="Alacritty"),
          Match(wm_class="kitty")],
    "6": [Match(wm_class="Emacs-30.2-gtk+x11"),
          Match(wm_class="emacs")],
    "7": [Match(wm_class="org.gnome.Nautilus")],
    "0": [Match(wm_class="virt-manager")],
}

for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            label=group_labels[i],
            matches=group_matches.get(group_names[i], []),
        ))

for i in groups:
    keys.extend(
        [
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc=f"Switch to group {i.name}",
            ),
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc=f"Switch to & move focused window to group {i.name}",
            ),
        ]
    )

layouts = [
    layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4),
]

widget_defaults = dict(
    font="sans",
    fontsize=24,
    padding=6,
)

extension_defaults = widget_defaults.copy()

logo = os.path.join(os.path.dirname(libqtile.resources.__file__), "logo.png")

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(),
                widget.Spacer(),
                widget.Systray(),
            ],
            48,
        ),
        background="#000000",
        wallpaper=logo,
        wallpaper_mode="center",
    ),
]

fake_screens: list[Screen] | None = None

mouse = [
    Drag([mod],  "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod],  "Button3", lazy.window.set_size_floating(),     start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),
        Match(wm_class="makebranch"),
        Match(wm_class="maketag"),
        Match(wm_class="ssh-askpass"),
        Match(title="branchdialog"),
        Match(title="pinentry"),
    ]
)

dgroups_key_binder              = None
dgroups_app_rules               = []
follow_mouse_focus              = True
bring_front_click               = False
floats_kept_above               = True
cursor_warp                     = False
auto_fullscreen                 = True
focus_on_window_activation      = "smart"
focus_previous_on_window_remove = False
reconfigure_screens             = True
auto_minimize                   = True
idle_timers                     = []
idle_inhibitors                 = []
wmname                          = "LG3D"

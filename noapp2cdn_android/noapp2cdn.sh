#!/data/data/com.termux/files/usr/bin/bash

cd "$(dirname "$0")" || exit 1

mkdir -p auto_prepare

prepare_folder() {
    folder="$1"

    echo
    game="$(basename "${folder%/}")"
    echo "Processing: $game"

    cd "$folder" || return

    has_no_extension=0

    for f in *; do
        [ -f "$f" ] || continue

        case "$f" in
            *.*) ;;
            *) has_no_extension=1 ;;
        esac
    done

    if [ -f title.tmd ] && [ "$has_no_extension" -eq 0 ]; then
        echo "Already prepared, skipping."
        cd - >/dev/null || exit 1
        return
    fi

    if [ "$has_no_extension" -eq 1 ]; then

        renamed_count=0

        for f in *; do
            [ -f "$f" ] || continue

            case "$f" in
                *.*) ;;
                *)
                    mv -- "$f" "$f.app"
                    renamed_count=$((renamed_count + 1))
                    ;;
            esac
        done

        echo "Added .app extension to $renamed_count file(s)."

    else

        echo "No files without extension found."

    fi

    if [ -f title.tmd ]; then

        echo "title.tmd already exists."

    else

        max=-1
        best=""

        for f in tmd.*; do
            [ -f "$f" ] || continue
            n="${f#tmd.}"

            case "$n" in
                ''|*[!0-9]*) continue ;;
            esac

            if [ "$n" -gt "$max" ]; then
                max="$n"
                best="$f"
            fi
        done

        if [ -n "$best" ]; then
            mv -- "$best" title.tmd
            echo "Renamed $best to title.tmd."
        else
            echo "Warning: no valid tmd.NUMBER file found."
        fi

    fi

    echo "Folder completed."

    cd - >/dev/null || exit 1
}

while true; do
    clear

    echo
    echo "noapp2cdn_android"
    echo
    echo "1) Prepare CDN folders"
    echo "9) Run first-time setup (required before first use)"
    echo "0) Exit"
    echo

    read -p "Choose what to do: " choice

    case "$choice" in

        1)
            clear

            found=0

            for D in auto_prepare/*/; do
                [ -d "$D" ] || continue
                found=1
                prepare_folder "$D"
            done

            if [ "$found" -eq 0 ]; then
                echo
                echo "No folders found in auto_prepare."
            else
                echo
                echo "Done."
            fi

            echo
            read -p "Press Enter to continue..."
            ;;

        9)
            clear
            bash ./noapp2cdn_setup.sh
            ;;

        0)
            clear
            exit 0
            ;;

        *)
            echo
            echo "Invalid choice."
            sleep 1
            ;;

    esac
done

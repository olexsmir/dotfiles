#/bin/sh
case "$(xkblayout)" in
    "Eng") echo "us" ;;
    "Rus") echo "ru" ;;
    "Ukr") echo "ua" ;;
esac

#!/bin/sh

get_icon() {
    case $1 in
        01d) icon="";;
        01n) icon="";;
        02d) icon="";;
        02n) icon="";;
        03*) icon="";;
        04*) icon="";;
        09d) icon="";;
        09n) icon="";;
        10d) icon="";;
        10n) icon="";;
        11d) icon="";;
        11n) icon="";;
        13d) icon="";;
        13n) icon="";;
        50d) icon="";;
        50n) icon="";;
        *) icon="";
    esac

    echo $icon
}

KEY="62aa945d9f0ba1190f5bdc23103fa0b6"
#CITY="298292982999"
CITY="Iskenderun,TR"
UNITS="metric"
SYMBOL="°"

API="https://api.openweathermap.org/data/2.5"

if [ -n "$CITY" ]; then
    if [ "$CITY" -eq "$CITY" ] 2>/dev/null; then
        CITY_PARAM="id=$CITY"
    else
        CITY_PARAM="q=$CITY"
    fi

    weather=$(curl -sf "$API/weather?appid=$KEY&$CITY_PARAM&units=$UNITS")
else
    location=$(curl -sf https://location.services.mozilla.com/v1/geolocate?key=geoclue)

    if [ -n "$location" ]; then
        location_lat="$(echo "$location" | jq '.location.lat')"
        location_lon="$(echo "$location" | jq '.location.lng')"

        weather=$(curl -sf "$API/weather?appid=$KEY&lat=$location_lat&lon=$location_lon&units=$UNITS")
    fi
fi

if [ -n "$weather" ]; then
    weather_temp=$(echo "$weather" | jq ".main.temp" | cut -d "." -f 1)
    weather_feel=$(echo "$weather" | jq ".main.feels_like" | cut -d "." -f 1)
    weather_min=$(echo "$weather" | jq ".main.temp_min" | cut -d "." -f 1)
    weather_max=$(echo "$weather" | jq ".main.temp_max" | cut -d "." -f 1)
    weather_press=$(echo "$weather" | jq ".main.pressure" | cut -d "." -f 1)
    weather_humid=$(echo "$weather" | jq ".main.humidity" | cut -d "." -f 1)
    weather_wind=$(echo "$weather" | jq ".wind.speed" | cut -d "." -f 1)
    weather_type=$(echo "$weather" | jq ".weather[0].main" | cut -d '"' -f 2)
    weather_icon=$(echo "$weather" | jq -r ".weather[0].icon")
    echo -e "$CITY\n---------------\n$weather_type $(get_icon "$weather_icon")\nTemp: $weather_temp$SYMBOL Feels like: $weather_feel$SYMBOL\nMin temp: $weather_min$SYMBOL Max temp: $weather_max$SYMBOL\nPressure: $weather_press Humidity: $weather_humid%\nWind: $weather_wind"Km/h""
fi

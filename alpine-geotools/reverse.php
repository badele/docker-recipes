<?php

require 'vendor/autoload.php';
use \League\Geotools\Coordinate\Coordinate;
use \League\Geotools\Coordinate\Ellipsoid;
use \Geocoder\Provider\GoogleMapsProvider;

function reverse($lat, $lon)
{
    global  $geocoder;

    try {
        $geocode = $geocoder->reverse($lat,$lon);
        return $geocode->first()->getLocality();
    } catch (Exception $e) {
        return NULL;
        print ("ERROR");
    }
}

# Get GPX filename
if ($argv[1]) {
  $url = $argv[1];
} else {
  $url = 'no-loop.gpx';
}

# Load GPX file
printf ("\nLoading '%s' GPX file\n", $url);
$xml = simplexml_load_file($url);
$track = $xml->trk->trkseg->trkpt;

# Get first track point
$latfirst=$track[0]['lat'];
$lonfirst=$track[0]['lon'];

# Get last track point
$latlast=$track[count($track) - 1]['lat'];
$lonlast=$track[count($track) - 1]['lon'];

# Init geocoder objects
$geocoder = new \Geocoder\ProviderAggregator();
$adapter  = new \Ivory\HttpAdapter\CurlHttpAdapter();
$chain = new \Geocoder\Provider\Chain([
    //new \Geocoder\Provider\GoogleMaps($adapter),
    new \Geocoder\Provider\Yandex($adapter,'en-US'),
]);
$geocoder->registerProvider($chain);

# Decode GPX track points
$start = reverse($latfirst,$lonfirst);
$end = reverse($latlast,$lonlast);

if ($start != $end) {
  printf ("No loop route: %s => %s\n\n", $start, $end);
} else {
  printf ("Loop route: %s\n", $start);
}

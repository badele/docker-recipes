# Sample geotools utilization

```
# Get no loop route
docker run --rm --interactive --tty badele/alpine-geotools php reverse.php no-loop.gpx
> Loading 'no-loop.gpx' GPX file
> No loop route: Reignier => Genève

# Get loop route
docker run --rm --interactive --tty badele/alpine-geotools php reverse.php loop.gpx
> Loading 'loop.gpx' GPX file
> Loop route: Montpellier
```

# Test from your GPX files

`docker run --rm --interactive --tty -v $(pwd):/gpx:ro badele/alpine-geotools php reverse.php /gpx/your_file.gpx`

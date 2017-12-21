# Sample geotools utilization

```
# Get no loop route
docker run --rm --interactive --tty 281256bed5c4 php reverse.php no-loop.gpx
> Loading 'no-loop.gpx' GPX file
> No loop route: Reignier => Genève

# Get loop route
docker run --rm --interactive --tty 281256bed5c4 php reverse.php loop.gpx
> Loading 'loop.gpx' GPX file
> Loop route: Montpellier
```

# <div align="center"> The Spatial Configuration Index (SCI) </div>
#### <div align="center"> The contained code was developed to analyze multiplex immunofluorescence data generated through AstroPath <div>
#### <div align="center">Contact: 16mrf6@queensu.ca</div>

![sci_logo](docs/sci_logo.png)

# Description
This code generates a Spatial Configuration Index (SCI) from a WSI database with the AstroPath schema. It works by first creating intermediary databases containing the counts of each unique spatial configuration per specimen using SQL, then transitioning to Python to compute the sum of select weighted spatial configuration densities per specimen, resulting in a single value for each specimen.

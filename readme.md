# Wellcome to rTunes

This is clone of itunes podcast made as side project for my pleasure.
The motivation was to be able to follow and listen to my dj subscriptions on all platforms and since I am using linux for development , there was no good way to listen to itunes podcasts except roll it online. 
So I did.


This application uses Amazon S3 to host image data of artists in cloud.
Prior to hosting the app, or running it locally in development mode don't forget to set up S3 credentials as required if config files.



To run test-suite set 'SLOW_SPECS=true' before rspec.

The app sets up daemon for updating the recent podcasts on the background. To start daemon for yourself run : 
"rake daemon:update_entries:start"


To check out the app online visit: http://stark-falls-8249.herokuapp.com/
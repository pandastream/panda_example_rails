Panda example application, Rails
=================================

An example Rails web app that uses [**Panda**](http://pandastream.com) to encode videos and embed them.

The full tutorial is available here: <http://pandastream.com/docs/integrate_with_rails>

See also:

* Panda gem: <http://github.com/pandastream/panda_gem/>
* Panda uploader: <http://www.pandastream.com/docs/uploader>


Setup
-----

This application has been tested successfully with **Rails 3.2.13**.

By default, Panda will encode your videos using the H.264 codec, playable with the HTML5 &lt;VIDEO&gt; tag. This example will use this to play your videos. Make sure you use a compatible browser to watch it.

Before running the app, you need to configure it with your Panda details. For this, copy the file `config/panda.yml.example` into `config/panda.yml`, and enter your details there.


What does this do anyway?
-------------------------

The application will initially show a simple form where you can specify a video file to upload from your computer. Once uploaded, it will ask you to wait a bit until all is encoded. You'll have to reload the page yourself until this is done.

Finally, the video will appear embedded on the page. If you wish to try again with another video, a link is provided to restart the process.


Notes
-----
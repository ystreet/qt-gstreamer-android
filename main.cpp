#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QQuickItem>
#include <QRunnable>
#include <gst/gst.h>

extern "C" gboolean gst_qt_android_init (GError ** error);

class SetPlaying : public QRunnable
{
public:
  SetPlaying(GstElement *);
  ~SetPlaying();

  void run ();

private:
  GstElement * pipeline_;
};

SetPlaying::SetPlaying (GstElement * pipeline)
{
  this->pipeline_ = pipeline ? static_cast<GstElement *> (gst_object_ref (pipeline)) : NULL;
}

SetPlaying::~SetPlaying ()
{
  if (this->pipeline_)
    gst_object_unref (this->pipeline_);
}

void
SetPlaying::run ()
{
  if (this->pipeline_)
    gst_element_set_state (this->pipeline_, GST_STATE_PLAYING);
}

int main(int argc, char *argv[])
{
  int ret;
  QApplication app(argc, argv);
  if (!gst_qt_android_init (NULL))
    return -1;

  GstElement *pipeline = gst_parse_launch ("videotestsrc ! x264enc tune=zerolatency ! video/x-h264,profile=baseline ! queue ! h264parse ! decodebin ! queue ! glupload ! glcolorconvert ! qmlglsink name=sink", NULL);
  /* the plugin must be loaded before loading the qml file to register the
   * GstGLVideoItem qml item */
  GstElement *sink = gst_bin_get_by_name (GST_BIN (pipeline), "sink");

  g_assert (sink);

  QQmlApplicationEngine engine;
  engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

  QQuickItem *videoItem;
  QQuickWindow *rootObject;

  /* find and set the videoItem on the sink */
  rootObject = static_cast<QQuickWindow *> (engine.rootObjects().first());
  videoItem = rootObject->findChild<QQuickItem *> ("videoItem");
  g_assert (videoItem);
  g_object_set(sink, "widget", videoItem, NULL);
  gst_object_unref (sink);

  rootObject->scheduleRenderJob (new SetPlaying (pipeline),
      QQuickWindow::BeforeSynchronizingStage);

  ret = app.exec();

  gst_element_set_state (pipeline, GST_STATE_NULL);
  gst_object_unref (pipeline);

  gst_deinit ();

  return ret;
}

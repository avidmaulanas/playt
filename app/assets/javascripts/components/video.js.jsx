var Video = React.createClass({
  propTypes: {
    thumbnailUrl: React.PropTypes.string,
    title: React.PropTypes.string,
    linkYt: React.PropTypes.string,
    channelTitle: React.PropTypes.string,
    userSignedIn: React.PropTypes.bool,
    isAdmin: React.PropTypes.bool,
    videoPath: React.PropTypes.string
  },

  render: function() {
    var removeVideo;

    if (this.props.userSignedIn && this.props.isAdmin){
      removeVideo = <RemoveVideo videoPath={this.props.videoPath} />
    }

    return (
      <div className="row video">
        <div className="col-md-12 box">
          <div className="col-md-4 col-sm-4 col-xs-12">
            <img src={this.props.thumbnailUrl} alt={this.props.title} className="img-responsive thumbnail" />
          </div>
          <div className="col-md-8 col-sm-8 col-xs-12">
            <h4><a href={this.props.linkYt} title={this.props.title} className="fancybox fancybox.iframe">{this.props.title}</a></h4>
            {removeVideo}
            <div className="text-muted">{this.props.channelTitle}</div>
          </div>
        </div>
      </div>
    );
  }
});

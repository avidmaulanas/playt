var RemoveVideo = React.createClass({
  propTypes: {
    videoPath: React.PropTypes.string
  },

  render: function() {
    return (
      <div className="btn-remove pull-right">
        <a href={this.props.videoPath} data-confirm="Are you sure?" data-toggle="tooltip" data-method="delete" title="Remove">
          <span className="glyphicon glyphicon-trash text-danger"></span>
        </a>
      </div>
    );
  }
});

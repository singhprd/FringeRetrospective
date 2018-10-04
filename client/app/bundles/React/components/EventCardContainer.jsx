import React, { Component } from 'react';
import PropTypes from 'prop-types';
import EventCard from './EventCard.jsx';

export class EventCardContainer extends Component {
  static propTypes = {
    eventJson: PropTypes.array,
    currentUserId: PropTypes.number
  };
  eventCards(){
    return this.props.eventJson.map(function(event){
      var eventJson = JSON.parse(event);
      return(
        <EventCard
          key={'event-card-key-' + eventJson.id}
          eventId={eventJson.id}
          currentUserId={this.props.currentUserId}
          eventJson={eventJson}
        />
      );
    }.bind(this));
  }
  render() {
    var eventCards = this.eventCards();
    return (
      <div>
        {eventCards}
      </div>
    );
  }
}

module.exports = EventCardContainer;

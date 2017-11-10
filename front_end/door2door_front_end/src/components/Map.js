import React from 'react';
import GoogleMapsWrapper from './GoogleMapsWrapper.js';
import { Marker } from 'react-google-maps';
import MarkerClusterer from "react-google-maps/lib/addons/MarkerClusterer";

class Map extends React.Component {
	componentWillMount() {
		this.setState({ markers: [] })
	}

	componentDidMount() {
		this.polling()
	}

	polling() {
    setTimeout(
      () => {
        this.fetchVehicleLocationsFromApi()
        this.polling()   
      }, 
      3000
    )
	}
	
	fetchVehicleLocationsFromApi() {
		const url = `http://localhost:3000/locations`
		
		fetch(url)
		.then(res => res.json())
		.then(data => {
			this.setState({ markers: data });
		});
	}

	render () {
		return (
			<GoogleMapsWrapper
				googleMapURL="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=geometry,drawing,places"
				loadingElement={<div style={{ height: `100%` }} />}
				containerElement={<div style={{ height: `60rem` }} />}
				mapElement={<div style={{ height: `100%` }} />}
				defaultZoom={11}
				defaultCenter={{ lat: 52.53, lng: 13.403 }}>
				<MarkerClusterer
					averageCenter
					enableRetinaIcons
					gridSize={60}
					>
					{this.state.markers.map(marker => (
						<Marker
							key={marker.location.vehicle_id}
							position={{ lat: parseFloat(marker.location.lat), lng: parseFloat(marker.location.lng) }}
							/>
					))}
				</MarkerClusterer>
			</GoogleMapsWrapper>
		);
	}
}

export default Map

// document.addEventListener("DOMContentLoaded", function() {
//   const locationButton = document.getElementById('get-location-btn');
//   const radiusInput = document.getElementById('radius-input'); // Optional radius input field
//   const locationResult = document.getElementById('location-result'); // To display the fetched result

  
//   if (locationButton) {
//     locationButton.addEventListener("click", function() {
      
//       if (navigator.geolocation) {
//         navigator.geolocation.getCurrentPosition(showPosition, showError); // Fetch the user's current location
//       } else {
//         alert("Geolocation is not supported by this browser.");
//       }
//     });
//   }

//   function showPosition(position) {
//     const latitude = position.coords.latitude;  
//     const longitude = position.coords.longitude;  
//     const radius = radiusInput ? radiusInput.value : 50;  

   
//     fetch("/fetch_location", {
//       method: "POST",
//       headers: {
//         "Content-Type": "application/json",
//         "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute("content") 
//       },
//       body: JSON.stringify({
//         latitude: latitude,
//         longitude: longitude,
//         radius: radius
//       })
//     })
//     .then(response => response.json())
//     .then(data => {
//       if (data.locations) {
//         let locationList = '';
//         data.locations.forEach(location => {
//           locationList += `You are near ${location.address} in ${location.city}, ${location.country}.\n`;
//         });
//         locationResult.innerText = locationList;  // Display the locations found
//       } else {
//         locationResult.innerText = 'No locations found within the specified radius.';
//       }
//     })
//     .catch(error => console.log('Error:', error));
//   }

 
//   function showError(error) {
//     switch(error.code) {
//       case error.PERMISSION_DENIED:
//         alert("User denied the request for Geolocation.");
//         break;
//       case error.POSITION_UNAVAILABLE:
//         alert("Location information is unavailable.");
//         break;
//       case error.TIMEOUT:
//         alert("The request to get user location timed out.");
//         break;
//       case error.UNKNOWN_ERROR:
//         alert("An unknown error occurred.");
//         break;
//     }
//   }
// });


// const locationResult = document.getElementById("location-result");
        
// document.getElementById("get-location-btn").addEventListener("click", getLocation);

// function getLocation() {
//     if (navigator.geolocation) {
//         navigator.geolocation.getCurrentPosition(showPosition, showError);
//     } else { 
//         locationResult.innerHTML = "Geolocation is not supported by this browser.";
//     }
// }

// function showPosition(position) {
//     const latitude = position.coords.latitude;
//     const longitude = position.coords.longitude;
//     const radius = document.getElementById("radius-input").value || 50; // default radius is 50 km
    
//     // Display the coordinates
//     locationResult.innerHTML = "Latitude: " + latitude + "<br>Longitude: " + longitude;

//     // Send the coordinates and radius to your Rails backend API
//     fetch("/fetch_location", {
//         method: "POST",
//         headers: {
//             "Content-Type": "application/json",
//             "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute("content") // Rails CSRF token
//         },
//         body: JSON.stringify({
//             latitude: latitude,
//             longitude: longitude,
//             radius: radius
//         })
//     })
//     .then(response => response.json())
//     .then(data => {
//         if (data.locations) {
//             let locationList = '';
//             data.locations.forEach(location => {
//                 locationList += `You are near ${location.address} in ${location.city}, ${location.country}.\n`;
//             });
//             locationResult.innerHTML += "<br>" + locationList;  // Append locations found
//         } else {
//             locationResult.innerHTML += "<br>No locations found within the specified radius.";
//         }
//     })
//     .catch(error => console.error('Error:', error));
// }

// function showError(error) {
//     switch(error.code) {
//         case error.PERMISSION_DENIED:
//             locationResult.innerHTML = "User denied the request for Geolocation.";
//             break;
//         case error.POSITION_UNAVAILABLE:
//             locationResult.innerHTML = "Location information is unavailable.";
//             break;
//         case error.TIMEOUT:
//             locationResult.innerHTML = "The request to get user location timed out.";
//             break;
//         case error.UNKNOWN_ERROR:
//             locationResult.innerHTML = "An unknown error occurred.";
//             break;
//     }
// }

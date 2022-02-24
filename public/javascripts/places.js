

places = document.querySelector('.search_results')
save_button = document.querySelector('.save-btn button')


// marked added places to the trip when user click "add to trip button"
if(places){
  places.addEventListener('click',function(event){
    event.preventDefault();
    element = event.target
    if(element.nodeName === 'BUTTON'){
      place_element = element.parentElement.parentElement
      
      if(element.innerText === 'Add to Trip'){
        element.innerText = 'Remove from Trip'
        element.style.backgroundColor = "#b0afaf"
        place_element.classList.toggle("added");
        place_element.querySelector('.marked').classList.toggle('hidden')
      }else{
        element.innerText = 'Add to Trip'
        element.style.backgroundColor = "black"
        place_element.classList.toggle("added");
        place_element.querySelector('.marked').classList.toggle('hidden')
      }
    }
    
  })
}

// when user click "save", save user selected places
if(save_button){
  save_button.addEventListener('click',function(){
    
    selected_places = document.querySelectorAll('.places .added .hidden_info')
    places_info = []

    for(var place of selected_places){
      places_info.push({
        place_name: place.children['place_name'].value, 
        google_place_id: place.children['google_place_id'].value, 
        latitudes: place.children['latitudes'].value,
        longitudes: place.children['longitudes'].value,
        formatted_address: place.children['formatted_address'].value,
        rating: place.children['rating'].value,
        user_ratings_total: place.children['user_ratings_total'].value,
        photo_reference: place.children['photo_reference'].value,
      })
    }
    
    json_string_places = JSON.stringify(places_info)
    var para = document.createElement("input")
    para.name = "places_info"
    para.type = "hidden"
    para.value = json_string_places
    form = document.querySelector("#save_form")
    form.appendChild(para)
  })
}
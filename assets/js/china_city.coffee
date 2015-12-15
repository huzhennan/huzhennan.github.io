---
---

$ ->
	PATTERN = /(\d{2})(\d{2})(\d{2})/
	
	node_state_select = $('#province-select')
	node_city_select = $('#city-select')
	node_district_select = $('#district-select')		
	
	province_code = (code) ->
		code.replace(PATTERN, "$10000")
		
	city_code = (code) ->
		code.replace(PATTERN, "$1$200")
	
	data = ->
		unless @list
			@list = {}
			for province in ChinaProvince
				do (province) ->
					@list[province["id"]] = {text: province["text"], cities: {}}
					return
					
			for city in ChinaCity
				do (city) ->
					pcode = province_code(city.id)
					p = @list[pcode]
					p.cities[city["id"]] = {text: city["text"], districts: {}}
					return
					
			for district in ChinaDistrict
				do (district) ->
					pcode = province_code(district.id)
					p = @list[pcode]
					ccode = city_code(district.id)
					city = p.cities[ccode]
					city.districts[district["id"]] = {text: district["text"]}
					return					 
		@list
		
	console.log data()
	states = data()
	
	init_select_node = (node) ->
		node.html ''
		opt = $(document.createElement('option')).attr('value', '').html('请选择')
		node.append(opt)
		return
	
	updateState = (selected) ->
		init_select_node(node_state_select)
		do (states) ->
			for own id, state of states
				name = state.text
				do (id, name) ->
					opt = $(document.createElement('option')).attr('value', id).html(name)
					if selected? and (selected is id)
						opt.prop 'selected', true
					node_state_select.append(opt)
					return

	
	initState = ->
		state_id = node_state_select.attr("data_init") || node_state_select.val()		
		updateState(state_id)
	
	updateCity = (state_id, selected=null) ->
		init_select_node(node_city_select)
		cities = data()[state_id].cities
		if cities?
			do (cities) ->
				for own id, city of cities
					name = city.text
					opt = $(document.createElement('option')).attr('value', id).html(name)
					if selected? and (selected is id)
						opt.prop 'selected', true
					node_city_select.append(opt)
		
	initCity = ->
		state_id = node_state_select.attr("data_init") || node_state_select.val()
		city_selected = node_city_select.attr("data_init")
		updateCity(state_id, city_selected)
		
	updateDistrict = (city_id, selected=null) ->
		init_select_node(node_district_select)
		pid = province_code(city_id)
		cities = data()[pid].cities
		districts = cities[city_id].districts
		if districts?
			do (districts) ->
				for own id, district of districts
					name = district.text
					opt = $(document.createElement('option')).attr('value', id).html(name)
					if selected? and (selected is id)
						opt.prop 'selected', true
					node_district_select.append(opt)
		
	initDistrict = ->
		city_id = node_city_select.attr("data_init") || node_city_select.val()
		district_selected = node_district_select.attr("data_init")
		updateDistrict(city_id, district_selected)
		
	displayResult = ->
		$("#val-city-select").html ''
		state = if $('#province-select option:selected').val() != "" then $('#province-select option:selected').html() else ""
		city = if $('#city-select option:selected').val() != "" then $('#city-select option:selected').html() else ""
		district = if $('#district-select option:selected').val() != "" then $('#district-select option:selected').html() else ""
		$("#val-city-select").html("#{state}#{city}#{district}") 
		

	init = ->
		initState()
		initCity()
		initDistrict()
		displayResult()
	
	init()
	
	node_state_select.change ->
		updateCity node_state_select.val()
		init_select_node(node_district_select)
		displayResult()
		return
		
	node_city_select.change ->
		updateDistrict node_city_select.val()
		displayResult()
		return
		
	node_district_select.change ->
		displayResult()
		return	

		
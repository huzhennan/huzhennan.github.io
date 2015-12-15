---
---

$ ->
	PATTERN = /(\d{2})(\d{2})(\d{2})/
	
	node_state_select = $('#province-select')		
	
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
						console.log name
						opt.prop 'selected', true
					node_state_select.append(opt)
					return

	
	initState = ->
		state_id = node_state_select.attr("data_init") || node_state_select.val()		
		updateState(state_id)

	init = ->
		initState()
	
	init()
	

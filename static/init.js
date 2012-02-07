var Haffen = {
	handlers: [],
	currentPage: '',
	goto: function(page, data) {
		$$('.page').addClass('hide');
		var current = $(page);
		if (current)
			current.removeClass('hide');
		var handler = Haffen.handlers[page];
		if (handler)
			handler();
		this.currentPage = page;
		location.hash = '#' + page;
	}
};

(function() {
	var lastHash = '';
	function hashListener() {
		if (location.hash.indexOf('#') == -1)
			location.hash = '#main';
		var page = location.hash.substr(1);
		if (page != Haffen.currentPage) {
			Haffen.goto(page);
		}
	}
	
	window.addEvent('load', function() {
		setInterval(hashListener, 10);
	});
})()

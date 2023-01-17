

let t, slider = {
	id: document.getElementById('slider'),
	startPoint: -2000,
	distance: 1000,
	index: 2,
	speed: 0.6,
	inProgress: true,
	timeout: function () { return this.speed * 1015 },
	current: function () { return this.id.children[this.index]; },
	increseIndex: function () { return ++this.index; },
	decreseIndex: function () { return --this.index; },
	moveLeft: function () { return this.startPoint -= this.distance; },
	moveRight: function () { return this.startPoint += this.distance; },
	length: function () { return this.id.childElementCount; }
};


initialize();


function initialize() {
	t = setInterval(function () { next(); }, 6000 + slider.timeout());
}

function start_loop() {
	t = setInterval(function () { next(); }, 6000 + slider.timeout());
}

function stop_loop() {
	clearInterval(t);
}

function next() {



	if (slider.inProgress) {
		slider.inProgress = !slider.inProgress;

		slider.current().classList.remove('active');
		slider.current().removeAttribute('class');
		slider.increseIndex();

		if (slider.index < slider.length()) slider.current().classList.add('active');

		slider.id.style.transition = slider.speed + 's';

		if (slider.index == slider.length() - 1) {
			//once moving to the last node, translate itself to first node
			slider.current().classList.add('active');
			slider.id.style.transform = 'translate(' + slider.moveLeft() + 'px, 0)';

			setTimeout(function () {

				slider.current().classList.remove('active');
				slider.current().removeAttribute('class');

				slider.startPoint = 0;
				slider.index = 0;

				slider.current().classList.add('active');

				slider.id.style.transition = '0.01s';
				slider.id.style.transform = 'translate(' + slider.startPoint + 'px, 0)';


			}, slider.timeout());
		}
		else if (slider.index == slider.length()) {
			slider.startPoint = 0;
			slider.id.style.transition = '0.01s';
			slider.id.style.transform = 'translate(' + slider.startPoint + 'px, 0)';

			setTimeout(function () {

				slider.index = 1;


				slider.current().classList.add('active');
				slider.id.style.transition = '0.6s';
				slider.id.style.transform = 'translate(' + slider.moveLeft() + 'px, 0)';


			}, 50);
		}
		else
			slider.id.style.transform = 'translate(' + slider.moveLeft() + 'px, 0)';


		//prevent user clicking so quickly in a split second
		setTimeout(function () { slider.inProgress = !slider.inProgress; }, slider.timeout());
	}



}

function previous() {

	if (slider.inProgress) {
		slider.inProgress = !slider.inProgress;

		slider.current().classList.remove('active');
		slider.current().removeAttribute('class');
		slider.decreseIndex();

		if (slider.index < slider.length() && slider.index > -1) slider.current().classList.add('active');

		slider.id.style.transition = slider.speed + 's';

		if (slider.index == 0) {
			//once moving to the last node, translate itself to first node
			slider.current().classList.add('active');
			slider.id.style.transform = 'translate(' + slider.moveRight() + 'px, 0)';

			setTimeout(function () {

				slider.current().classList.remove('active');
				slider.current().removeAttribute('class');

				slider.startPoint = -1 * (slider.length() - 1) * slider.distance;;
				slider.index = slider.length() - 1;

				slider.current().classList.add('active');

				slider.id.style.transition = '0.01s';
				slider.id.style.transform = 'translate(' + slider.startPoint + 'px, 0)';


			}, slider.timeout());
		}
		else if (slider.index == -1) {
			//if index out of range, move to the second to last
			slider.startPoint = -1 * (slider.length() - 1) * slider.distance;
			slider.id.style.transition = '0.01s';
			slider.id.style.transform = 'translate(' + slider.startPoint + 'px, 0)';

			setTimeout(function () {


				slider.index = slider.length() - 2;

				slider.current().classList.add('active');
				slider.id.style.transition = '0.6s';
				slider.id.style.transform = 'translate(' + slider.moveRight() + 'px, 0)';


			}, 50);

		}
		else
			slider.id.style.transform = 'translate(' + slider.moveRight() + 'px, 0)';


		//prevent user clicking so quickly in a split second
		setTimeout(function () { slider.inProgress = !slider.inProgress; }, slider.timeout());
	}


}
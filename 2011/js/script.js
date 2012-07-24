/* Author: Kyle Fritz <kyle.p.fritz@gmail.com>

*/
betascape={
  changeCurrent:function(changeTo){
    $('nav li.current').removeClass('current');
    $('nav li.'+changeTo).addClass('current');
  }
  , getPresenters:function(callback){
    $.getJSON(
      "https://spreadsheets.google.com/feeds/cells/0AvQ7pVUg-X_RdDlYZ0hUNVFOWEItMTBqNGk4YkFuUkE/od6/public/basic?authkey=CN2q874D&alt=json-in-script&callback=?",
      function(data,status){
        var rows=_.groupBy(data.feed.entry,function(e){return e.title.$t.match(/[A-Za-z]+(\d+)/)[1];})
        var presenters=_.map(rows,function(row){
          var presenter={};
          var lectureTypeLookup={i:"Interactive Lounge",l:"Lectures",
                                 w:"Workshops",c:"Conversations",
                                 ccf:"CreateCamp Facilitator"};
		  //Gives us a time for each workshop
		  var fortyMinSlotStartTimeLookup={1:"10am", 2:"10:45am", 3:"11:30am", 4:"12:15am", 5:"2:00pm", 6:"2:45pm", 7:"3:30pm", 8:"4:15pm"};
		  var fortyMinSlotEndTimeLookup={1:"10:40am", 2:"11:25am", 3:"12:10am", 4:"12:55am", 5:"2:40pm", 6:"3:25pm", 7:"4:10pm", 8:"4:55pm"};
		  var eightyMinSlotStartTimeLookup={1:"10am", 2:"11:30am", 3:"2:00pm", 4:"3:30pm"};
		  var eightyMinSlotEndTimeLookup={1:"11:25am", 2:"12:55am", 3:"3:25pm", 4:"4:55pm"};
          $.each(row,function(colIdx){
            var col=row[colIdx];
            var colLetter=col.title.$t.match(/([A-Za-z]+)\d+/)[1].toLowerCase();
            var content=col.content.$t;
            if(colLetter==="a"){
                presenter.lectureType=lectureTypeLookup[ content.toLowerCase() ];
              }else if(colLetter==="b"){
                presenter.name=content;
              }else if(colLetter==="c"){
                presenter.bio=content;
              }else if(colLetter==="d"){
                //thank-you very much @abachman!
                if (content.trim().length) content= /^https?:\/\//i.test(content) ? content : "http://" + content;
                presenter.website=content;
              }else if(colLetter=="e"){
                presenter.atBetascape=content;
              }else if(colLetter=="f"){
                presenter.twitter=content;
              }else if(colLetter=="g"){
                presenter.exhibitTitle=content;
              }else if(colLetter=="h"){
                presenter.secondPresenter=content;
              }else if(colLetter=="i"){
                presenter.secondPresenterTwitter=content;
              }else if(colLetter=="j"){
                presenter.trackNumber=content;

                if (presenter.lectureType == "Workshops" && presenter.trackNumber) {
                	presenter.startTime=eightyMinSlotStartTimeLookup [ content.slice(-1) ];
					presenter.endTime=eightyMinSlotEndTimeLookup [ content.slice(-1) ];
                } else if (presenter.trackNumber) {
                	presenter.startTime=fortyMinSlotStartTimeLookup [ content.slice(-1) ];
					presenter.endTime=fortyMinSlotEndTimeLookup [ content.slice(-1) ];
                }
                
              }else{
                if(typeof(console)!="undefined"){
                  console.log('whats that?',colLetter,content);
                }
            }
          });
          return presenter;
        });
        var headers=presenters.shift();
        callback(presenters);
    });
  }
};

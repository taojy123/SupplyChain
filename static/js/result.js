// JavaScript Document

function initialize() {
    //地図を表示
    var mapDiv = document.getElementById('map_canvas');
    var mapCanvas = new google.maps.Map(mapDiv);
    mapCanvas.setMapTypeId(google.maps.MapTypeId.ROADMAP);

    //地図上にマーカーを配置していく
    var station, i, latlng;
    for (i in stationList) {
        //マーカーを作成
        station = stationList[i];
        latlng = new google.maps.LatLng(station.latlng[0], station.latlng[1]);
        var marker = createMarker(
            mapCanvas, latlng, station.name,station.info
        );
    }

    //地図上にラインを書く
    var bounds = new google.maps.LatLngBounds();
    var pair;
    for (j in pairList) {
        pair = pairList[j];
        from = new google.maps.LatLng(pair.from[0], pair.from[1]);
        to = new google.maps.LatLng(pair.to[0], pair.to[1]);
        bounds.extend(from);
        bounds.extend(to);
        var polyline =createLine(mapCanvas,from,to);

        mind = new google.maps.LatLng(pair.mind[0], pair.mind[1]);
        var marker = createMindMarker(mapCanvas, mind, pair.content);
    }
    //マーカーが全て収まるように地図の中心とズームを調整して表示
    mapCanvas.fitBounds(bounds);

}

function createMindMarker(map,latlng,content) {
    //マーカーを作成
    var marker = new google.maps.Marker({
        position : latlng,
        map : map,
        icon: '/static/images/arrow.png'
    });

    var context;
    context = content
    //情報ウィンドウを作成
    var infoWnd = new google.maps.InfoWindow({
        content : context
    });

    //マーカーがクリックされたら、情報ウィンドウを表示
    google.maps.event.addListener(marker, 'click', function(){
        infoWnd.open(map, marker);
    });
    return marker;
}


function createMarker(map, latlng, title,info) {

    //マーカーを作成
    var marker = new google.maps.Marker({
        position : latlng,
        map : map,
        icon: '/static/images/node.png',
        title : title
    });
    var context;
    context = info;

    //情報ウィンドウを作成
    var infoWnd = new google.maps.InfoWindow({
        content : context
    });

    //マーカーがクリックされたら、情報ウィンドウを表示
    google.maps.event.addListener(marker, 'click', function(){
        infoWnd.open(map, marker);
    });
    return marker;
}



function createLine(map,from,to) {
    var polyline = new google.maps.Polyline({
        map : map,
        path : [from,to],
        strokeColor : "green",
        strokeOpacity : 0.9,
        strokeWeight : 3
    });

    return polyline
}


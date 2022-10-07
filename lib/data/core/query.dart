const query = """
{
  map_markers(general:
  {language: "by",city: "minsk",country: "by",subscription: "platinum",
  activity:[],tag:[]},
  leftTopPoint:{lat:53.93051341740901,lng:27.332954406738285},
  centerPoint:{lat: 53.84300734638802,lng: 27.477321624755863}) {
    lat
    lng
    suppliers {
        id
        name
    }
  }
}
""";

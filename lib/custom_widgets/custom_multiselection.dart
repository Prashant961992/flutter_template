import '../index.dart';

typedef Null ItemSelectedCallback(int value);

class MultiSelectionAlert extends StatefulWidget {
  final List<CountryList> listCountryData;
  final ItemSelectedCallback onItemSelected;

  MultiSelectionAlert({Key key, this.listCountryData, this.onItemSelected})
      : super(key: key);

  @override
  _MultiSelectionAlertState createState() => _MultiSelectionAlertState();
}

class _MultiSelectionAlertState extends State<MultiSelectionAlert> {
  TextEditingController _searchQuery;
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: widget.listCountryData,
      builder:
          (BuildContext context, AsyncSnapshot<List<CountryList>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Text('Loading....'),
          );
        }
        return loadData(snapshot.requireData);
      },
    );
  }

  Widget loadData(List<CountryList> datas) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(padding),
      ),
      elevation: 1.0,
      backgroundColor: Colors.transparent,
      child: Container(
        child: Column(
          children: <Widget>[
            header('What is Lorem Ipsum?'),
            _buildSearchField(),
            Flexible(
                // flex: 7,
                child: Container(
                  height: MediaQuery.of(context)
                      .size
                      .height, // Change as per your requirement
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: ListView.builder(
                    shrinkWrap: true,
                    // physics: ClampingScrollPhysics(),
                    itemCount: datas.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        color: Colors.transparent,
                        // margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                        // height: 50,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(datas[index].name),
                              trailing: Checkbox(
                                value: datas[index].isSelected,
                                onChanged: (bool value) {
                                  setState(() {
                                    var selecteddata = datas[index];
                                    selecteddata.isSelected = value;
                                    datas.removeAt(index);
                                    datas.insert(index, selecteddata);
                                  });
                                },
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                              height: 1,
                              indent: 15,
                              endIndent: 0,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )),
            footer()
          ],
        ),
      ),
    );
  }

  Widget header(title) {
    return Flexible(
        // flex: 1,
        child: Container(
          color: Colors.blueAccent,
          child: Row(
            children: <Widget>[
              SizedBox(width: 5),
              Expanded(
                flex: 1,
                child: Container(
                  height: 50,
                  width: 50,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.close, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                flex: 9,
                child: SingleChildScrollView(
                  child: Text(title, style: TextStyle(color: Colors.white)),
                ),
              )
            ],
          ),
        ));
  }

  Widget search() {
    return Flexible(
        // flex: 1,
        child: Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: new TextField(
            controller: _searchQuery,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: 'Search...',
              border: InputBorder.none,
              hintStyle: const TextStyle(color: Colors.white30),
            ),
            style: const TextStyle(color: Colors.white, fontSize: 16.0),
            onChanged: updateSearchQuery,
          ),
        ));
  }

  Widget _buildSearchField() {
    return Expanded(
        // flex: 1,
        child: Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: new TextFormField(
            controller: _searchQuery,
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Search...',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              // prefixIcon: Icon(Icons.mail_outline),
              // suffixIcon: widget.isShowsuffixIcon == true ? Icon(Icons.arrow_drop_down) : null,
              // border: UnderlineInputBorder(),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
            style: const TextStyle(color: Colors.black, fontSize: 16.0),
            onChanged: updateSearchQuery,
          ),
        ));
  }

  void updateSearchQuery(String newQuery) {
    // filteredRecored.clear();
    if (newQuery.length > 0) {
      // Set<Country> set = Set.from(allRecord);
      // set.forEach((element) => filterList(element, newQuery));
    }

    // if (newQuery.isEmpty) {
    //   filteredRecored.addAll(allRecord);
    // }

    setState(() {});
  }

  // filterList(Country country, String searchQuery) {
  //   // setState(() {
  //   //   if (country.name.toLowerCase().contains(searchQuery) ||
  //   //       country.name.contains(searchQuery)) {
  //   //     filteredRecored.add(country);
  //   //   }
  //   // });
  // }

  void _startSearch() {
    ModalRoute.of(context)
        .addLocalHistoryEntry(new LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearchQuery();

    setState(() {
      _isSearching = false;
      // filteredRecored.addAll(allRecord);
    });
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQuery.clear();
      // updateSearchQuery("Search query");
    });
  }

  Widget footer() {
    return Flexible(
        // flex: 1,
        child: Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              SizedBox(width: 10),
              Expanded(
                flex: 5,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child:
                      Text('Cancel', style: TextStyle(color: Colors.blueGrey)),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.blueGrey,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 5,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  onPressed: () {
                    // widget.onItemSelected(1);
                  },
                  color: Colors.lightBlueAccent,
                  child: Text('Submit', style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
        ));
  }
}

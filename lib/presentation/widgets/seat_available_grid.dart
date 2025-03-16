import 'package:flutter/material.dart';
import 'package:moviebooker/core/colors.dart';
import 'package:moviebooker/presentation/widgets/screen_widget.dart';

class SeatAvailableGrid extends StatefulWidget {
  final List<List<int>> seatLayout;
  final bool fromSelectSeat;
  final Function(Set<String>, int)? onSeatSelectionChanged; // Callback added

  const SeatAvailableGrid({
    super.key,
    required this.seatLayout,
    this.fromSelectSeat = false,
    this.onSeatSelectionChanged, // Receive callback
  });

  @override
  _SeatAvailableGridState createState() => _SeatAvailableGridState();
}

class _SeatAvailableGridState extends State<SeatAvailableGrid> {
  double seatSize = 5;
  Map<String, int> selectedSeats =
      {}; // Stores selected seat positions with prices

  void _toggleSeatSelection(int row, int col) {
    String seatKey = '$row-$col';
    int seatType = widget.seatLayout[row][col];

    if (seatType == 0) return; // Cannot select unavailable seats

    setState(() {
      if (selectedSeats.containsKey(seatKey)) {
        selectedSeats.remove(seatKey); // Deselect
      } else {
        int price = seatType == 2 ? 150 : 50; // Example: 2 = VIP, 1 = Regular
        selectedSeats[seatKey] = price; // Select with price
      }
    });

    // Notify parent widget of selection change
    if (widget.onSeatSelectionChanged != null) {
      int totalPrice = selectedSeats.values.fold(
        0,
        (sum, price) => sum + price,
      );
      widget.onSeatSelectionChanged!(selectedSeats.keys.toSet(), totalPrice);
    }
  }

  @override
  void initState() {
    super.initState();
    seatSize = widget.fromSelectSeat ? 7 : 5;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          widget.fromSelectSeat
              ? MediaQuery.of(context).size.height * 0.4
              : 200,
      child: Column(
        children: [
          Container(height: 30, child: CurvedScreen()), // Screen widget
          SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: List.generate(widget.seatLayout.length, (row) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(widget.seatLayout[row].length, (
                        col,
                      ) {
                        int seatType = widget.seatLayout[row][col];
                        Color seatColor =
                            AppColors.seatTypeColors[seatType] ??
                            Colors.transparent;

                        String seatKey = '$row-$col';
                        if (selectedSeats.containsKey(seatKey)) {
                          seatColor = Colors.amber; // Selected seat color
                        }

                        return GestureDetector(
                          onTap:
                              (widget.fromSelectSeat && seatType>0)
                                  ? () => _toggleSeatSelection(row, col)
                                  : null,
                          child: Container(
                            margin: EdgeInsets.all(
                              widget.fromSelectSeat ? 4 : 2,
                            ),
                            width: seatSize,
                            height: seatSize,
                            decoration: BoxDecoration(
                              color: seatColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        );
                      }),
                    );
                  }),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          if (widget.fromSelectSeat)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _zoomButton(Icons.add, () {
                  setState(() {
                    if (seatSize < 40) seatSize += 5;
                  });
                }),
                SizedBox(width: 5),
                _zoomButton(Icons.remove, () {
                  setState(() {
                    if (seatSize > 10) seatSize -= 5;
                  });
                }),
                SizedBox(width: 10),
              ],
            ),
          SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget _zoomButton(IconData icon, VoidCallback onPressed) {
    return IconButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          AppColors.white,
        ), // Wrap color in MaterialStateProperty
      ),
      icon: Icon(icon, size: 28),
      onPressed: onPressed,
      color: AppColors.black,
    );
  }
}

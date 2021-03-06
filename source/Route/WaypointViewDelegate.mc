using Toybox.WatchUi as Ui;

(:savememory)
class WaypointViewDelegate extends Ui.BehaviorDelegate 
{
    hidden var _waypointView;
    hidden var _gpsWrapper;
    
    function initialize(waypointView, gpsWrapper) 
    {
        BehaviorDelegate.initialize();
        _waypointView = waypointView;
        _gpsWrapper = gpsWrapper;
    }    
    
    function onSelect()
    {
        // if recording available, make sound
        //
    	if (_gpsWrapper.StartStopRecording())
        {
            SignalWrapper.PressButton();
        }
    	return true;
    }

    function onMenu() 
    {
        Ui.popView(Ui.SLIDE_IMMEDIATE);
        return true;
    }
    
    function onBack()
    {
        // if lap successfully added, make sound
        //
        if (_gpsWrapper.AddLap())
        {
            SignalWrapper.PressButton();
        }
        return true;
    }
    
    function onNextPage()
    {
    	_waypointView.NextWayPoint();
    	return true;
    }
    
    function  onPreviousPage()
    {
    	_waypointView.PrevWayPoint();
    	return true;
    }
    
}
package Foswiki::Contrib::JSCalendarContrib::Maintenance;

our $maintain = 1;
sub maintain {
    Foswiki::Plugins::MaintenancePlugin::registerCheck("jscalendercontrib:settings_language", {
        name => "JSCalenderContrib language setting",
        description => "JSCALENDARCONTRIB_LANG setting in missing in SitePreferences",
        check => sub {
            my $result = { result => 0 };
            my ( $spmeta, $sp ) = Foswiki::Func::readTopic( 'Main', 'SitePreferences');
            if ( $spmeta->getPreference( "JSCALENDARCONTRIB_LANG" ) eq '' ) {
                $result->{result} = 1;
                $result->{priority} = ERROR;
                $result->{solution} = "Add '   * Set JSCALENDARCONTRIB_LANG = %<nop>LANGUAGE% to [[Main.SitePreferences]].";
            }
            return $result;
        }
    });
}

1;

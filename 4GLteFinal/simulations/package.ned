package _4gltefinal.simulations;

import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.networklayer.ipv4.RoutingTableRecorder;
import inet.node.ethernet.Eth10G;
import inet.node.inet.Router;
import inet.node.inet.StandardHost;
import simu5g.world.radio.ChannelControl;
import simu5g.common.binder.Binder;
import simu5g.common.carrierAggregation.CarrierAggregation;
import simu5g.nodes.Ue;
import simu5g.nodes.eNodeB;
import simu5g.nodes.ExtCell;
import simu5g.nodes.PgwStandard;
network CombinedNetwork
{
    parameters:
        int numUe1 = default(1);
        int numUe2 = default(1);
        int numUe3 = default(1);
        int numUe4 = default(1);
        int numUe5 = default(1);
        @display("i=block/network2;bgb=2294.5798,824.14496");
        int numUeD2D = default(0);
        int numUe = default(1);
        int numUeD2DRx = default(0);
        int numUeD2DTx = default(0);
        int numUeCell = default(1);
        int numExtCells = default(0);
    submodules:
        channelControl: LteChannelControl {
            @display("p=152.805,52.604996;is=s");
        }
        routingRecorder: RoutingTableRecorder {
            @display("p=585.5481,50.821156;is=s");
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=366.79617,50.821156;is=s");
        }
        binder: Binder {
            @display("p=766.7366,50.821156;is=s");
        }
        server: StandardHost {
            @display("p=1566.6174,172.35;is=n;i=device/server");
        }
        router: Router {
            @display("p=1378.8,170.1404;i=device/smallrouter");
        }
        pgw: PgwStandard {
            @display("p=1089.6749,172.84499;is=l");
        }
        eNodeB1: eNodeB {
            @display("p=460.91995,523.545;is=l");
        }
        eNodeB2: eNodeB {
            @display("p=839.1749,523.545;is=l");
        }
        eNodeB3: eNodeB {
            @display("p=1167.33,523.545;is=l");
        }
        eNodeB4: eNodeB {
            @display("p=1568.1299,523.545;is=l");
        }
        eNodeB5: eNodeB {
            @display("p=1888.7698,523.545;is=l");
        }
        ue1[numUe1]: Ue {
            @display("p=561.11993,573.64496;is=s");
        }
        ue2[numUe2]: Ue {
            @display("p=939.37494,573.64496;is=s");
        }
        ue3[numUe3]: Ue {
            @display("p=1267.5299,573.64496;is=s");
        }
        ue4[numUe4]: Ue {
            @display("p=1668.3298,573.64496;is=s");
        }
        ue5[numUe5]: Ue {
            @display("p=1988.9698,573.64496;is=s");
        }
        d2dMultihopStatistics: MultihopD2DStatistics {
            @display("p=2148.6301,172.35;is=s");
        }
        eventGenerator: EventGenerator {
            @display("p=2148.6301,272.8875;is=s");
        }
        ue[numUe]: Ue {
            @display("p=861.75006,656.2558;is=s");
        }
        ueD2DRx[numUeD2DRx]: Ue {
            @display("p=815.34814,656.2558;is=s");
        }
        ueD2DTx[numUeD2DTx]: Ue {
            @display("p=497.16348,656.2558;is=s");
        }
        ueCell[numUeCell]: Ue {
            @display("p=437.50388,656.2558;is=s");
        }
        extCell[numExtCells]: ExtCell {
            @display("p=216.93199,494.56;is=vl");
        }
        carrierAggregation: CarrierAggregation {
            @display("p=2148.6301,68.94;is=s");
        }
    connections:
        router.pppg++ <--> Eth10G <--> pgw.filterGate;
        pgw.pppg++ <--> Eth10G <--> eNodeB1.ppp;
        pgw.pppg++ <--> Eth10G <--> eNodeB2.ppp;
        pgw.pppg++ <--> Eth10G <--> eNodeB3.ppp;
        pgw.pppg++ <--> Eth10G <--> eNodeB4.ppp;
        pgw.pppg++ <--> Eth10G <--> eNodeB5.ppp;
        server.pppg++ <--> Eth10G <--> router.pppg++;
        eNodeB2.x2++ <--> Eth10G <--> eNodeB3.x2++;
        eNodeB1.x2++ <--> Eth10G <--> eNodeB3.x2++;
        eNodeB1.x2++ <--> Eth10G <--> eNodeB2.x2++;
}
import simu5g.apps.d2dMultihop.statistics.MultihopD2DStatistics;

import simu5g.apps.d2dMultihop.eventGenerator.EventGenerator;
import simu5g.world.radio.LteChannelControl;

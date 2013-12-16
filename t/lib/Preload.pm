package Preload;
use strict; use warnings;

# use Moose; # errors about role conflict, in any case is loaded via OX
use Test::Most;
use DBIx::Class;
use DBD::Pg;
use Text::Xslate;

use OX;
use OX::Request;
use OX::Response;
use OX::RouteBuilder::Code;
use OX::RouteBuilder::ControllerAction;
use OX::RouteBuilder::HTTPMethod;

1;

use ExtUtils::MakeMaker;

WriteMakefile(
    NAME		=> 'CGI::Untaint::url',
    VERSION_FROM	=> 'lib/CGI/Untaint/url.pm', 
    PREREQ_PM		=> { 
      CGI::Untaint => 0.07,
      URI::Find     => 0.01,
    }, 
    ($] > 5.005 ? () : (
      ABSTRACT_FROM => 'lib/CGI/Untaint/url.pm', 
      AUTHOR        => 'Tony Bowden <kasei@tmtm.com>',
    )),
);

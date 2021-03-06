/*##############################################################################

    HPCC SYSTEMS software Copyright (C) 2012 HPCC Systems®.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
############################################################################## */

__set_debug_option__('targetClusterType', 'hthor');

d := dataset('~local::rkc::person',
{ string10 f1,
  unsigned4 f2;
  unsigned8 filepos{virtual(fileposition)} }, flat);

i := index(d, { d } ,'\\home\\person.name_first.key', sorted);

string5 s5 := '' : stored('s5');
string10 s10 := '' : stored('s10');
string15 s15 := '' : stored('s15');

unsigned2 u2 := 0 : stored('u2');
unsigned4 u4 := 0 : stored('u4');
unsigned8 u8 := 0 : stored('u8');

// should fail - casting from string10 to unsigned2 can produce the same value for several different source strings
output(i(keyed((unsigned2)f1 = u2)));



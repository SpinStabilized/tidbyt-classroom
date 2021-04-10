# -*- coding: utf-8 -*-
from __future__ import annotations

import arrow
import pathlib

from mako.template import Template

class Countdown:
    def __init__(self, target_event: arrow.Arrow,
                       event_name: str,
                       mako_file: pathlib.Path,
                       output_file: pathlib.Path) -> None:
        self.target_event = target_event
        self.event_name = event_name
        self.mako_file = mako_file
        self.output_file = output_file
        self.template = Template(
            filename=str(mako_file.expanduser())
        )
    
    def render(self) -> None:
        delta_string = self.target_event.humanize(
            granularity=['day', 'hour', 'minute'],
            only_distance=True
        )

        with open(self.output_file, 'w') as f:
            f.write(self.template.render(delta_string=delta_string))

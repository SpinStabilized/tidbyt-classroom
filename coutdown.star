###############################################################################
# A countdown clock tidbyt app
#
###############################################################################
load("math.star", "math")
load("render.star", "render")
load("time.star", "time")


###############################################################################
# Constants
###############################################################################
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = MINUTES_PER_HOUR * 24

exam_timestamp = 1652623200

def main(config):
    # duration = time.fromtimestamp(exam_timestamp) - time.now()
    # days, hours, minutes = duration_to_hms(duration)
    return render.Root(
        delay = 500,
        child = render.Box(
            child = render.Animation(
                children = [
                    render.Text(
                        content = '{}:{}:{}'.format(*delta_in_hms(exam_timestamp)),
                        font = "6x13"
                    ),
                    render.Text(
                        content = '{} {} {}'.format(*delta_in_hms(exam_timestamp)),
                        font = "6x13"
                    )
                ]
            )
        )
    )

def delta_in_hms(timestamp):
    print('foo')
    duration = time.fromtimestamp(timestamp) - time.now()
    days = duration.minutes() // MINUTES_PER_DAY
    remainder = duration.minutes() - (days * MINUTES_PER_DAY)
    hours = remainder // MINUTES_PER_HOUR
    minutes = math.floor(remainder - (hours * MINUTES_PER_HOUR))
    return days, hours, minutes

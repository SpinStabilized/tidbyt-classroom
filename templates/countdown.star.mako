# A countdown clock tidbyt app

load("render.star", "render")

def main(config):
    return render.Root(
        delay = 500,
        child = render.Box(
            child = render.Marquee(
                        width=64,
                        child=render.Text('${delta_string}'),
                        offset_start=5,
                        offset_end=32
            ) 
        )
    )

